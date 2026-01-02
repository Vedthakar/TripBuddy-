from django.urls import path
from .views import TripListDummyView

urlpatterns = [
    path("trips/", TripListDummyView.as_view(), name="trip-list-dummy"),
]