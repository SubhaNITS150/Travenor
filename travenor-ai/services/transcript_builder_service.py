import whisperx

class TranscriptBuilderService:

    @staticmethod
    def build(
        transcription_result,
        diarization_result
    ):
        result = whisperx.assign_word_speakers(
            diarization_result,
            transcription_result
        )

        transcript = ""
        for segment in result["segments"]:
            speaker = segment.get(
                "speaker",
                "UNKNOWN"
            )
            text = segment["text"]
            transcript += f"{speaker}: {text}\n"

        return transcript