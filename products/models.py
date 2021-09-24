from django.db import models
from django.shortcuts import reverse
from django.core.validators import MaxValueValidator, MinValueValidator


class Category(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Categories'


class Product(models.Model):
    title = models.CharField(max_length=200, blank=False, null=False)
    price = models.FloatField(blank=False, null=False)
    description = models.TextField(max_length=5000, blank=False, null=False)
    image = models.ImageField(upload_to="static/img/products_image", blank=False, null=False)
    rate = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(5), MinValueValidator(0)])
    count = models.PositiveIntegerField(blank=True, null=True)

    # Product views
    views = models.PositiveIntegerField(default=0)

    UNAVAILABLE = False
    AVAILABLE = True
    status_type = (
        (UNAVAILABLE, "unavailable"),
        (AVAILABLE, "available")
    )
    status = models.BooleanField(default=True, choices=status_type, blank=False, null=False)

    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', blank=False, null=False)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        # Each time user visits product
        self.views += 1
        return reverse("products:product-detail", kwargs={'id': self.id})


