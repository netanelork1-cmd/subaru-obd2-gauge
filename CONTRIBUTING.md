# Contributing

Thanks for helping. Most useful right now: **verified codes for other Subaru models**.

## Ground rules

1. **Read-only, always.** No change may send anything other than a read request: `AT` setup, mode `01`, `03`, `07`, `0A`, `09`, or `22`. The whitelist in `isReadOnly()` stays as strict as it is. Pull requests that add mode `04`, `14`, `2E`, `31` or any write or clear command will be closed.
2. **No guessed codes.** A code goes into the defaults only after it was read on a real car and matched against a trusted tool (ActiveOBD, SSM, a factory scan tool). Say which car and which tool.
3. **Go easy on the bus.** Requests are sent one at a time with a pause between them. Don't shorten the gaps or poll faster than once a second.

## Sharing a code for your car

Open a **New code** issue. It asks for:

- model, year, engine and gearbox (and VIN digits 4–8 if you like, never the full VIN)
- header (`7E0` engine, `7E1` gearbox, …), request (`22xxxx`) and the raw reply
- the formula, and what the trusted tool showed at the same moment, ideally at two different values

## Code style

Everything lives in `index.html`: plain HTML, CSS and JavaScript, with no build step and no dependencies. Keep it that way. Match the existing style, and comment the *why* (for example, where a code was verified).
