terraform {
  backend "s3" {
    bucket         = "eksgitopsbucket"
    key            = "backend/ToDo-App.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "eksgitopsdynamo"
  }
}