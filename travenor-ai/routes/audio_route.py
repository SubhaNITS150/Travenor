from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import requests
import shutil
import os
from tempfile import NamedTemporaryFile

from services.transcription_service import (
    TranscriptionService
)

from services.diarization_service import (
    DiarizationService
)

from services.transcript_builder_service import (
    TranscriptBuilderService
)

from services.location_extraction_service import (
    LocationExtractionService
)

router = APIRouter()


class ExtractLocationsRequest(BaseModel):
    meeting_id: str
    audio_path: str


@router.post("/extract-locations")
async def extract_locations(request: ExtractLocationsRequest):

    audio_path = None

    try:
        response = requests.get(request.audio_path, stream=True)
        response.raise_for_status()

        # Save to a temporary file
        with NamedTemporaryFile(delete=False, suffix=".mp3") as tmp:
            shutil.copyfileobj(response.raw, tmp)
            audio_path = tmp.name

        # Transcribe audio
        transcription = TranscriptionService.transcribe(
            audio_path
        )

        # Perform speaker diarization
        diarization = DiarizationService.diarize(
            audio_path
        )

        # Build transcript
        transcript = TranscriptBuilderService.build(
            transcription,
            diarization
        )

        # Extract locations
        locations = LocationExtractionService.extract(
            transcript
        )

        return {
            "meeting_id": request.meeting_id,
            "transcript": transcript,
            "locations": locations
        }

    except requests.exceptions.RequestException as e:
        raise HTTPException(
            status_code=400,
            detail=f"Failed to download audio: {str(e)}"
        )

    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=str(e)
        )

    finally:
        if audio_path and os.path.exists(audio_path):
            os.remove(audio_path)