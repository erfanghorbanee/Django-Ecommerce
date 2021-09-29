from django.contrib import admin
from .models import Order, OrderHistory, OrderItem

admin.site.register(OrderHistory)
admin.site.register(Order)
admin.site.register(OrderItem)


