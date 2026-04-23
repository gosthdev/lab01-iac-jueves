# lab01-iac-jueves

Infraestructura local con Terraform y Docker para levantar 3 contenedores:

- `web`
- `api`
- `db` (PostgreSQL)

Se trabaja con 2 entornos usando `terraform workspace`:

- `dev`
- `qa`

## 1. Requisitos

- Docker instalado y en ejecución.
- Terraform instalado.
- Git instalado.

Comandos de verificación:

```bash
docker --version
terraform --version
git --version
```

## 2. Descargar proyecto

```bash
git clone <URL_DEL_REPOSITORIO>
cd practica-iac/lab01-iac-jueves
```

## 3. Construir imágenes Docker

Terraform usa estas imágenes por nombre:

- `lab/web`
- `lab/api`
- `lab/db`

Construcción:

```bash
docker build -t lab/web ./src/web01
docker build -t lab/api ./src/api
docker build -t lab/db ./src/db
```

## 4. Inicializar Terraform

```bash
terraform init
```

## 5. Levantar entorno `dev`

Seleccionar o crear workspace:

```bash
terraform workspace select dev 
terraform workspace new dev
```

Aplicar infraestructura:

```bash
terraform apply -
```

Verificar contenedores:

```bash
docker ps
```

Puertos esperados en `dev` (segun `terraform.tfvars`):

- web
- api
- db

## 6. Levantar entorno `qa`

Seleccionar o crear workspace:

```bash
terraform workspace select qa  
terraform workspace new qa
```

Aplicar infraestructura:

```bash
terraform apply 
```

Verificar contenedores:

```bash
docker ps
```

Puertos esperados en `qa` (segun `terraform.tfvars`):

- web
- api 
- db

## 7. Cambiar entre entornos

Cambiar workspace:

```bash
terraform workspace select dev
# o
terraform workspace select qa
```
