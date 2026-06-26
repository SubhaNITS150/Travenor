LABELS = [
    "location",
    "place",
    "city",
    "state",
    "country",
    "village",
    "tourist destination",
    "mountain",
    "trek",
    "region",
    "beach",
    "national park",
    "lake",
    "island",
    "temple",
    "museum",
    "monument",
    "historical site",
    "tourist attraction"
]


class LocationExtractionService:

    @staticmethod
    def extract(
        transcript: str,
        gliner_model
    ):
        entities = gliner_model.predict_entities(
            transcript,
            LABELS
        )

        locations = []
        for entity in entities:
            locations.append(
                entity["text"].strip()
            )

        return list(
            dict.fromkeys(locations)
        )