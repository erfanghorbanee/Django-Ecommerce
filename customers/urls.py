from django.urls import path
from .views import profile_view, orders_history_view, recent_orders_view
from .api.views import discount_code_view

urlpatterns = [
    path('profile/', profile_view, name='profile'),
    path('orders/', orders_history_view, name='orders'),
    path('orders/recent/', recent_orders_view, name='recent_orders'),
    path('rest/discount-code/', discount_code_view, name='discount_code'),

]