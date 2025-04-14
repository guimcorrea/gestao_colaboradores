from django.db import models

class Colaborador(models.Model):
    nome = models.CharField(max_length=100)
    cargo = models.CharField(max_length=50)
    data_admissao = models.DateField()

    def __str__(self):
        return self.nome

