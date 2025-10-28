LICENSE := ASL2-Short

GOIMPORTS := go run golang.org/x/tools/cmd/goimports
GOLICENSER := go run github.com/elastic/go-licenser

check-fmt:
	@${GOLICENSER} -d -license ${LICENSE}
	@${GOIMPORTS} -l -e -local github.com/elastic . | read && echo "Code differs from gofmt's style. Run 'gofmt -w .'" 1>&2 && exit 1 || true

fmt:
	${GOLICENSER} -license ${LICENSE}
	${GOIMPORTS} -l -w -local github.com/elastic .

.PHONY: check-fmt fmt