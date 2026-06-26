from pydantic import BaseModel
from typing import List, Optional


class Preferences(BaseModel):
    adventure: bool = False
    nature: bool = False
    cultural: bool = False
    food: bool = False
    nightlife: bool = False


class TripInfo(BaseModel):
    startDate: str
    endDate: str
    budget: str
    preferences: Optional[Preferences] = None


class StartLocation(BaseModel):
    name: str
    latitude: float
    longitude: float


class Destination(BaseModel):
    id: str
    name: str
    latitude: float
    longitude: float
    description: Optional[str] = None
    destinationType: Optional[str] = None
    avgBudget: Optional[float] = None
    rating: Optional[float] = None


class TouristSpot(BaseModel):
    id: str
    destinationId: str
    spotName: str
    category: str
    description: Optional[str] = None
    entryFee: Optional[float] = 0
    latitude: Optional[float] = None
    longitude: Optional[float] = None
    distanceFromCity: Optional[float] = None


class Hotel(BaseModel):
    id: str
    hotelName: str
    latitude: Optional[float] = None
    longitude: Optional[float] = None
    rating: Optional[float] = None
    starCategory: Optional[int] = None
    pricePerNight: Optional[float] = None


class ItineraryRequest(BaseModel):
    tripInfo: TripInfo
    startLocation: StartLocation
    destinations: List[Destination]
    touristSpots: List[TouristSpot]
    hotels: List[Hotel]