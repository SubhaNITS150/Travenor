class DayAttraction {
  final String name;
  final String time;
  final String? imageUrl;

  const DayAttraction({
    required this.name,
    required this.time,
    this.imageUrl,
  });
}

class HotelInfo {
  final String name;
  final String location;
  final String phone;
  final String pricePerNight;
  final bool isNightStay;
  final String? imageUrl;

  const HotelInfo({
    required this.name,
    required this.location,
    required this.phone,
    required this.pricePerNight,
    this.isNightStay = false,
    this.imageUrl,
  });
}

class DayItinerary {
  final int dayNumber;
  final String from;
  final String to;
  final String timeRange;
  final List<DayAttraction> attractions;
  final HotelInfo? hotel;
  final String emoji;

  const DayItinerary({
    required this.dayNumber,
    required this.from,
    required this.to,
    required this.timeRange,
    required this.attractions,
    this.hotel,
    this.emoji = '📍',
  });
}

class TripData {
  final String title;
  final String duration;
  final int destinations;
  final int hotels;
  final String totalCost;
  final List<DayItinerary> days;

  const TripData({
    required this.title,
    required this.duration,
    required this.destinations,
    required this.hotels,
    required this.totalCost,
    required this.days,
  });
}

// ─── Sample Meghalaya data ────────────────────────────────────

const kMeghalayaTrip = TripData(
  title: 'Meghalaya Adventure Plan 🏔️',
  duration: '4 Days / 3 Nights',
  destinations: 8,
  hotels: 2,
  totalCost: '₹ 8,500',
  days: [
    DayItinerary(
      dayNumber: 1,
      from: 'Guwahati',
      to: 'Shillong',
      timeRange: 'Morning 6 – 7 AM',
      emoji: '☀️',
      attractions: [
        DayAttraction(name: 'Umiam Lake', time: '9:00 AM'),
        DayAttraction(name: 'Laitlum Canyon', time: '11:30 AM'),
        DayAttraction(name: 'Elephant Falls', time: '2:30 PM'),
        DayAttraction(name: 'Police Bazaar', time: '5:30 PM'),
      ],
      hotel: HotelInfo(
        name: 'Hotel City View Inn',
        location: 'Shillong, Police Bazaar',
        phone: '098300 24025',
        pricePerNight: '₹ 1,900',
        isNightStay: true,
      ),
    ),
    DayItinerary(
      dayNumber: 2,
      from: 'Shillong',
      to: 'Cherrapunji',
      timeRange: '',
      emoji: '⭐',
      attractions: [
        DayAttraction(name: 'Elephant Falls', time: '9:00 AM'),
        DayAttraction(name: 'Mawsmai Valley', time: '10:30 AM'),
        DayAttraction(name: 'Nohkalikai Falls', time: '3:00 PM'),
      ],
      hotel: HotelInfo(
        name: 'Blesy Homestay',
        location: 'Cherrapunji',
        phone: '098303 09600',
        pricePerNight: '₹ 1,500',
        isNightStay: true,
      ),
    ),
    DayItinerary(
      dayNumber: 3,
      from: 'Cherrapunji',
      to: 'Mawlynnong & Dawki',
      timeRange: '',
      emoji: '⭐',
      attractions: [
        DayAttraction(name: 'Mawlynnong', time: '8:30 AM'),
        DayAttraction(name: 'Living Root Bridge', time: '1:00 PM'),
        DayAttraction(name: 'Dawki', time: '3:00 PM'),
      ],
      hotel: HotelInfo(
        name: 'Dawki Riverside Stay',
        location: 'Dawki',
        phone: '098150 12325',
        pricePerNight: '₹ 1,800',
        isNightStay: true,
      ),
    ),
    DayItinerary(
      dayNumber: 4,
      from: 'Dawki',
      to: 'Guwahati',
      timeRange: '',
      emoji: '⭐',
      attractions: [
        DayAttraction(name: 'Boat Riding at Dawki River', time: '9:00 AM'),
        DayAttraction(name: 'Bang Sen Vich', time: '11:30 AM'),
        DayAttraction(name: 'Phe Phe Fall', time: '3:00 PM'),
        DayAttraction(name: 'Guwahati', time: '7:00 PM'),
      ],
    ),
  ],
);