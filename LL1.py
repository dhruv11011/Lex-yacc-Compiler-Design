# Define the LL(1) grammar as a dictionary where keys are non-terminals, and values are lists of production rules.
grammar = {
    'S': ['aAB', 'bBA'],
    'A': ['cA', 'd'],
    'B': ['eB', 'f'],
}

# Initialize FIRST and FOLLOW sets as dictionaries.
first = {}
follow = {}

# Initialize the terminals and non-terminals set.
terminals = set()
non_terminals = set(grammar.keys())

# Helper function to determine if a symbol is a terminal.
def is_terminal(symbol):
    return symbol not in non_terminals

# Initialize FIRST sets for all symbols.o
for symbol in non_terminals:
    first[symbol] = set()

# Initialize a set to keep track of non-terminals for which FIRST sets have been calculated.
first_calculated = set()

# Helper function to calculate FIRST sets for non-terminals.
def calculate_first(symbol):
    if is_terminal(symbol):
        return set(symbol)
    if symbol in first_calculated:
        return first[symbol]

    first_calculated.add(symbol)
    result = set()
    for rule in grammar[symbol]:
        i = 0
        while i < len(rule):
            first_of_next = calculate_first(rule[i])
            result.update(first_of_next)
            if '' not in first_of_next:
                break
            i += 1
        if i == len(rule):
            result.add('')

    first[symbol] = result
    return first[symbol]

# Calculate FIRST sets for all non-terminals.
for symbol in non_terminals:
    calculate_first(symbol)

# Initialize FOLLOW sets for all non-terminals.
for symbol in non_terminals:
    follow[symbol] = set()

# Set the start symbol's FOLLOW to '$'.
start_symbol = 'S'
follow[start_symbol].add('$')

# Helper function to calculate FOLLOW sets for non-terminals.
def calculate_follow(symbol):
    for s in grammar:
        for rule in grammar[s]:
            if symbol in rule:
                idx = rule.index(symbol)
                if idx == len(rule) - 1:
                    follow[s].update(follow[symbol])
                else:
                    next_symbol = rule[idx + 1]
                    first_of_next = calculate_first(next_symbol)
                    if '' in first_of_next:
                        follow[s].update(first_of_next - {''})
                        follow[s].update(follow[symbol])
                    else:
                        follow[s].update(first_of_next)

# Calculate FOLLOW sets for all non-terminals.
for symbol in non_terminals:
    calculate_follow(symbol)

# Print FIRST and FOLLOW sets.
print("FIRST Sets:")
for symbol in first:
    print(f'FIRST({symbol}) = {first[symbol]}')

print("\nFOLLOW Sets:")
for symbol in follow:
    print(f'FOLLOW({symbol}) = {follow[symbol]}')
