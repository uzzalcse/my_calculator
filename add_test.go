package main 

import "testing"

func TestAdd(t *testing.T) {
	got := Add(10, 50)
	want := 60
	if got!=want {
		t.Errorf("got %q, wanted %q", got, want)
	}
}