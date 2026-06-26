import whisperx
from gliner import GLiNER

_whisper = None
_gliner = None

def get_models():
    global _whisper, _gliner
    device = "cpu"

    if _whisper is None:
        print(f"Loading Whisper model on {device}...")
        _whisper = whisperx.load_model(
            "medium",  
            device,
            compute_type="float16" if device == "cuda" else "int8"
        )
        print("Whisper model loaded")

    if _gliner is None:
        print("Loading GLiNER model...")
        _gliner = GLiNER.from_pretrained(
            "urchade/gliner_medium-v2.1"
        )
        print("GLiNER model loaded")

    return _whisper, _gliner



    