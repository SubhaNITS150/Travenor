import os
from dotenv import load_dotenv
import whisperx

load_dotenv()

HF_TOKEN = os.getenv("HF_TOKEN")


class DiarizationService:

    @staticmethod
    def diarize(audio_path: str):
        diarize_model = whisperx.DiarizationPipeline(
            use_auth_token=HF_TOKEN,
            device="cpu"
        )

        diarize_segments = diarize_model(audio_path)

        return diarize_segments