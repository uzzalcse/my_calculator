package main 

import "testing"

func TestSubtract(t *testing.T) {
	got := Subtract(120, 100)
	want := 20
	if want != got {
		t.Errorf("got %q, wanted %q", got, want)
	}
}