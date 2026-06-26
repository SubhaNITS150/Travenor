class TranscriptionService:

    @staticmethod
    def transcribe(
        audio_path: str,
        whisper_model
    ):
        return whisper_model.transcribe(audio_path)