from django.urls import path
from .views import profile_view, orders_history_view, recent_orders_view

urlpatterns = [
    path('profile/', profile_view, name='profile'),
    path('orders/', orders_history_view, name='orders'),
    path('orders/recent/', recent_orders_view, name='recent_orders'),
]