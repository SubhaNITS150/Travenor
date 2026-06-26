import whisperx

class DiarizationService:

    @staticmethod
    def diarize(audio_path: str):

        diarize_model = whisperx.DiarizationPipeline(
            use_auth_token="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",
            device="cpu"
        )

        diarize_segments = diarize_model(audio_path)

        return diarize_segments