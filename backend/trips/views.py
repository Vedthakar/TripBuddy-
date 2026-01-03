from rest_framework.response import Response
from rest_framework.views import APIView

# Create your views here.
class TripListDummyView(APIView):
    def get(self, request):
        dummy_trips = [
            {
                "id": 1,
                "name": "Mexico Trip",
                "destination": "Cancun, Mexico",
                "start_date": "2026-1-15",
                "end_date": "2026-1-22",
                "created_at": "2025-12-22T12:00:00Z"
            },
            {
                "id": 2,
                "name": "Paris Trip",
                "destination": "Paris, France",
                "start_date": "2026-2-10",
                "end_date": "2026-2-17",
                "created_at": "2025-12-23T14:30:00Z"
            },
        ]

        return Response(dummy_trips)