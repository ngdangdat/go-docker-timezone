package main

import (
	"fmt"
	"time"
)

func main() {
	// 2019-06-05T18:07:29+07:00
	timestamp := int64(1559732849)
	tz := "Asia/Ho_Chi_Minh"

	loc, _ := time.LoadLocation(tz)
	t := time.Unix(timestamp, 10).In(loc)
	fmt.Printf("Corresponding timestring for timestamp %v in tz '%v': %v\n", timestamp, tz, t.Format(time.RFC3339))
}
