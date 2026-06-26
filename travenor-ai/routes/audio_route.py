from fastapi import APIRouter
from fastapi import UploadFile
from fastapi import File

from tempfile import NamedTemporaryFile
import shutil
import os

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


@router.post("/extract-locations")
async def extract_locations(
    audio: UploadFile = File(...)
):

    with NamedTemporaryFile(
        delete=False,
        suffix=".mp3"
    ) as tmp:

        shutil.copyfileobj(
            audio.file,
            tmp
        )

        audio_path = tmp.name

    try:

        transcription = (
            TranscriptionService.transcribe(
                audio_path
            )
        )

        diarization = (
            DiarizationService.diarize(
                audio_path
            )
        )

        transcript = (
            TranscriptBuilderService.build(
                transcription,
                diarization
            )
        )

        locations = (
            LocationExtractionService.extract(
                transcript
            )
        )

        return {
            "transcript": transcript,
            "locations": locations
        }

    finally:

        if os.path.exists(audio_path):
            os.remove(audio_path)