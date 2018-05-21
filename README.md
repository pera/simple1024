# simple1024
This is an ongoing effort to create a reasonably good word list for [sdice](https://github.com/pera/sdice), an easily auditable passphrase generator for Unix-like systems. The initial version of *sdice* used a subset of EFF's [Short Wordlist #1](https://www.eff.org/dice), which have some great properties but unfortunately contains many words that I (a non-native English speaker) am unfamiliar with, and therefore some of the generated passphrases were considerably more difficult to remember than others. Because of this, some users (such as myself :) may feel the temptation of rolling till they get a nice passphrase, resulting in an unknown reduction of entropy.

The *wordlist.asc* file contains 1024 English words each of which should ideally respect all of the following principles:
- Most English speakers probably know its definition and spelling.
- It is generally not considered charged.
- It is a lexical lemma (i.e. in dictionary form).
- It is not a homophone except for those that are also homonyms.
- A length between 3 and 6 characters, with a preference for shorter words.
- It has a minimum Levenshtein distance of 2 between any other word in the list.

Additionally, words that have a root with multiple similar descendants among Indo-European languages should be given preference (e.g. "album").

To identify what words are known by the vast majority of English speakers we consider the extremely useful data that is being gathered by the [Center for Reading Research](http://crr.ugent.be/). Another important resources for vocabulary are the [Simple English Wikipedia](https://simple.wikipedia.org/), Princeton's [WordNet](https://wordnet.princeton.edu/), the BNC [frequency list](http://ucrel.lancs.ac.uk/bncfreq/flists.html) and the [12Dicts Package](http://wordlist.aspell.net/12dicts/).

The included Perl script named *gen.pl* is a tool that groups together entries from a word list file when they have a distance of just 1 character. Another useful tool to analyze word lists is [dwdiff](https://os.ghalkes.nl/dwdiff.html) (a word level diff).

Comments are very welcome: please feel free to use GitHub's Issues page for them.

