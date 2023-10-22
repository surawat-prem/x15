package watermark

import (
	"context"

	"github.com/velotiotech/watermark-service/internal"
)

type Service interface {
	Get(ctx context.Context, filters ...internal.Filter) ([]internal.Document, error)
}
