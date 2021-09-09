from django.contrib import admin
from .models import Order, OrderHistory

admin.site.register(Order)
admin.site.register(OrderHistory)

