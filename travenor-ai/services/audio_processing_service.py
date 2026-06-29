import os
from tempfile import NamedTemporaryFile
from minio import Minio
from services.transcription_service import TranscriptionService
from services.diarization_service import DiarizationService
from services.transcript_builder_service import TranscriptBuilderService
from services.location_extraction_service import LocationExtractionService
from services.model_loader_service import get_models


minio_client = Minio(
    "127.0.0.1:9000",
    access_key="admin",
    secret_key="admin12345",
    secure=False
)

BUCKET_NAME = "meeting-audios"


def process_audio(request):

    with NamedTemporaryFile(delete=False, suffix=".mp3") as tmp:
        audio_path = tmp.name

    try:
        print(f"Downloading {request.audio_path} from MinIO...")

        minio_client.fget_object(
            BUCKET_NAME,
            request.audio_path,
            audio_path
        )

        print("Audio downloaded successfully.")

        whisper_model, gliner_model = get_models()

        print("Running transcription...")
        transcription_result = TranscriptionService.transcribe(
            audio_path,
            whisper_model
        )

        print("Running diarization...")
        diarization_result = DiarizationService.diarize(
            audio_path
        )

        print("Building transcript...")
        transcript = TranscriptBuilderService.build(
            transcription_result,
            diarization_result
        )

        print("Extracting locations...")
        locations = LocationExtractionService.extract(
            transcript,
            gliner_model
        )

        print(transcript)
        
        return {
            "meeting_id": request.meeting_id,
            "transcript": transcript,
            "locations": locations
        }

    finally:
        if os.path.exists(audio_path):
            os.remove(audio_path)