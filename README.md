<div align="center">

# 🧳 Travenor

### AI-Powered Collaborative Travel Planning from Group Conversations

Turn a messy group voice/text discussion into a structured, actionable travel itinerary — automatically.

<p>
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white" />
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Apache_Kafka-231F20?style=for-the-badge&logo=apachekafka&logoColor=white" />
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
</p>

</div>

---

## 📖 Overview

Planning a trip in a group usually means one person scrolling back through hours of chat or a call, manually noting down everyone's preferences, dates, and budget constraints, and then piecing together an itinerary by hand.

**Travenor automates that entire process.** Users record or upload a group meeting (audio or transcript), and Travenor:
1. Transcribes the conversation with high accuracy,
2. Extracts key travel-relevant entities — locations, dates, preferences, budget constraints,
3. Synthesizes those entities into a structured, actionable itinerary,
4. Syncs the result in real time to every collaborator's device.

The result: a group's spoken intent becomes a shared, editable travel plan — no manual note-taking required.

---

## ✨ Core Features

- 🎙️ **Audio-to-itinerary pipeline** — upload group meeting audio and get a structured trip plan back.
- 🧠 **NLP-driven entity extraction** — automatically pulls out destinations, dates, budgets, and preferences from natural conversation.
- 👥 **Real-time collaborative editing** — all group members see itinerary updates live.
- ⚡ **Non-blocking, event-driven backend** — heavy AI processing never freezes the app; users get instant acknowledgement while transcription/extraction happens asynchronously.
- 🔐 **Secure, cloud-native architecture** — built with authentication and API security as first-class concerns, not an afterthought.

---

## 🏗️ Tech Stack

| Layer | Technology | Purpose |
|---|---|---|
| **Frontend** | Flutter | Cross-platform mobile client with real-time state management for live collaboration |
| **Backend** | Node.js, Express.js, Python | API layer + AI service orchestration |
| **Database** | PostgreSQL, Supabase | Persistent storage for users, trips, and itineraries |
| **ORM** | Prisma | Type-safe database access and schema management |
| **Message Broker** | Apache Kafka | Decouples audio ingestion from AI processing via async events |
| **AI — Transcription** | WhisperX | High-accuracy speech-to-text from group meeting audio |
| **AI — NLP** | GLiNER | Named entity extraction (locations, dates, preferences, budget) |
| **DevOps** | Docker | Local orchestration of Kafka + microservices for development and testing |

---

## 🧩 System Architecture

Travenor is built as an **event-driven, distributed system** rather than a monolithic request/response app. This is a deliberate choice: audio transcription and NLP extraction are computationally heavy and can take real time to complete, so they cannot sit in the critical path of a user-facing API call.

### Design Principles

**1. Asynchronous Processing**
Audio ingestion and AI transcription are decoupled from the main application thread using Kafka. The app acknowledges the user's input immediately and processes the heavy AI workload in the background — the UI stays responsive at all times.

**2. Component Isolation**
Mobile clients, the message broker, and AI services are strictly separated layers. If the AI pipeline is under heavy load (e.g., a burst of uploads), core trip-planning and browsing features remain fully accessible — a failure or slowdown in one component doesn't cascade into the rest of the system.

**3. Cloud-Native & Secure by Default**
The system is designed around secure authentication, clean API contracts, and real-time data sync for collaborative multi-user sessions.

### Architecture Diagram (Conceptual)

```
┌─────────────────┐        ┌──────────────────┐        ┌───────────────────────┐
│  Flutter Client  │──────▶│  Node/Express API │──────▶│   Kafka Topic (audio)  │
│ (group members)  │◀──────│   (ack + auth)    │        └───────────┬───────────┘
└─────────────────┘        └──────────────────┘                    │
                                                                     ▼
                                                        ┌────────────────────────┐
                                                        │  Transcription Service  │
                                                        │       (WhisperX)        │
                                                        └───────────┬────────────┘
                                                                     │ transcript
                                                                     ▼
                                                        ┌────────────────────────┐
                                                        │   NLP Entity Extractor  │
                                                        │        (GLiNER)         │
                                                        └───────────┬────────────┘
                                                                     │ entities
                                                                     ▼
                                                        ┌────────────────────────┐
                                                        │  Itinerary Synthesis    │
                                                        └───────────┬────────────┘
                                                                     │
                                                                     ▼
                                                 ┌─────────────────────────────────┐
                                                 │  PostgreSQL / Supabase (Prisma)  │
                                                 └───────────────┬─────────────────┘
                                                                 │ real-time sync
                                                                 ▼
                                                     ┌──────────────────────┐
                                                     │  Flutter Client(s)   │
                                                     │  (all group members) │
                                                     └──────────────────────┘
```

---

## 🔄 System Workflow

1. **Input & Audio Ingestion** — Users supply group meeting audio or transcripts through the Flutter mobile client.
2. **Event Publishing** — The backend receives the input and publishes a message to a Kafka topic, immediately acknowledging the user without waiting for processing to complete.
3. **AI Pipeline Execution**
   - The transcription service consumes the Kafka event and runs the audio through **WhisperX** to generate an accurate transcript.
   - The transcript is passed to **GLiNER**, which extracts key entities: locations, dates, preferences, and budget constraints.
4. **Itinerary Generation** — Extracted entities are synthesized into actionable travel recommendations and a structured itinerary.
5. **Real-Time Sync** — The final itinerary is saved to PostgreSQL/Supabase and pushed live to the collaborative frontend, updating the trip plan for every group member simultaneously.

---

## 💻 Local Development

Travenor's distributed architecture (Kafka + multiple services) is fully containerized so it can be reliably reproduced on any machine.

### Prerequisites
- Docker & Docker Compose
- Node.js (LTS)
- Python 3.10+
- Flutter SDK

### Setup

```bash
# Clone the repository
git clone https://github.com/SubhaNITS150/travenor.git
cd travenor

# Spin up backend services (Kafka, Postgres, API, AI services)
docker-compose up -d

# Install backend dependencies
cd backend
npm install
npx prisma generate
npx prisma migrate dev

# Install Python AI service dependencies
cd ../ai-service
pip install -r requirements.txt

# Run the Flutter client
cd ../mobile
flutter pub get
flutter run
```

> ⚙️ Adjust paths/commands above to match your actual repo structure and `docker-compose.yml` service names.

### Environment Variables

Create a `.env` file in the backend root with (at minimum):

```env
DATABASE_URL=postgresql://user:password@localhost:5432/travenor
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_key
KAFKA_BROKER=localhost:9092
JWT_SECRET=your_jwt_secret
```

---

## 📂 Project Structure (Suggested)

```
travenor/
├── mobile/                # Flutter app
├── backend/                # Node.js + Express API, Prisma schema
│   ├── src/
│   ├── prisma/
│   └── package.json
├── ai-service/              # Python service — WhisperX + GLiNER pipeline
│   ├── transcription/
│   ├── entity_extraction/
│   └── requirements.txt
├── docker-compose.yml       # Kafka, Postgres, and service orchestration
└── README.md
```

---

## 🗺️ Roadmap

- [ ] Multi-language transcription support
- [ ] Budget optimization suggestions based on group preferences
- [ ] Offline-first itinerary caching in the Flutter client
- [ ] Integration with flight/hotel booking APIs for one-tap booking

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome. Feel free to check the [issues page](https://github.com/SubhaNITS150/travenor/issues).

## 📄 License

This project is licensed under the MIT License.

## 📫 Contact

**Subhajyoti Dey**
[LinkedIn](https://www.linkedin.com/in/subhajyoti-dey-635922235/) · [Email](mailto:subhajyotidey2910@gmail.com) · [GitHub](https://github.com/SubhaNITS150)
