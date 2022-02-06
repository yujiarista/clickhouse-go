// +build !amd64

// Code generated by make codegen DO NOT EDIT.
// source: lib/column/codegen/column_safe.tpl

package column

import (
	"github.com/ClickHouse/clickhouse-go/v2/lib/binary"
)


{{- range . }}

func (col *{{ .ChType }}) Decode(decoder *binary.Decoder, rows int) error {
	for i := 0; i < rows; i++ {
		v, err := decoder.{{ .ChType }}()
		if err != nil {
			return err
		}
		*col = append(*col, v)
	}
	return nil
}

func (col *{{ .ChType }}) Encode(encoder *binary.Encoder) error {
	for _, v := range *col {
		if err := encoder.{{ .ChType }}(v); err != nil {
			return err
		}
	}
	return nil
}

{{- end }}