# Generated by Django 3.2.7 on 2021-10-10 14:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customers', '0003_alter_discountcode_code'),
    ]

    operations = [
        migrations.AddField(
            model_name='address',
            name='city',
            field=models.CharField(default='tehran', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='address',
            name='province',
            field=models.CharField(default='tehran', max_length=100),
            preserve_default=False,
        ),
    ]