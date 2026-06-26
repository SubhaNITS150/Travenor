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

from services.model_loader_service import (
    get_models
)


def process_audio(request):
    print("Loading Models")

    whisper_model, gliner_model = get_models()

    print("Transcription Service")
    transcription_result = (
        TranscriptionService.transcribe(
            request.audio_path,
            whisper_model
        )
    )

    print("Diarization Service")
    diarization_result = (
        DiarizationService.diarize(
            request.audio_path
        )
    )

    print("Transcript Builder Service")
    transcript = (
        TranscriptBuilderService.build(
            transcription_result,
            diarization_result
        )
    )

    print("Location Extraction Service")
    locations = (
        LocationExtractionService.extract(
            transcript,
            gliner_model
        )
    )

    return {
        "transcript": transcript,
        "locations": locations
    }