package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/surawat-prem/x15/microservices/api-service/database"
)

func main() {
	app := fiber.New()

	database.ConnectDB()

	app.Get("/", func(c *fiber.Ctx) error {
		err := c.SendString("This is api-service!")
		return err
	})

	app.Listen(":3333")
}
