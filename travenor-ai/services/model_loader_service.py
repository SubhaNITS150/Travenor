import whisperx
from gliner import GLiNER
import torch

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"

_whisper_model = None
_gliner_model = None


def get_models():
    global _whisper_model
    global _gliner_model

    if _whisper_model is None:
        print("Loading Whisper Model...")

        _whisper_model = whisperx.load_model(
            "large-v3",
            DEVICE,
            compute_type="float16" if DEVICE == "cuda" else "int8"
        )

    if _gliner_model is None:
        print("Loading GLiNER Model...")

        _gliner_model = GLiNER.from_pretrained(
            "urchade/gliner_medium-v2.1"
        )

    return _whisper_model, _gliner_model