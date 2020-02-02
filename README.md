# Probabilistic Online Knowledge Graph Construction from Natural Language 

**Quick Links:**
- [PDF](https://github.com/Cortys/bachelor-thesis/raw/master/thesis/build/main.pdf)
- [Presentation](https://github.com/Cortys/bachelor-thesis/raw/master/presentation/presentation.pptx)

The thesis and presentation are only available in German.
The reference implementation is not publically available for legal reasons.

### Abstract (English translation)
In this thesis a method for the automated construction of knowledge graphs from natural language communication data (e.g. e-mails) is proposed.
The proposed method successively transforms a stream of text messages into a knowledge graph.
It works in two steps:
In the first step a message is processed using the Stanford CoreNLP library.
The thereby extracted knowledge is then inserted into a knowledge graph via inference rules formulated in the Probabilistic Soft Logic (PSL) framework.
The structure of the constructed knowledge graph is based on the theory of J. F. Sowa's conceptual graphs.
New in this work is the combination of conceputal graphs, CoreNLP and PSL.
The advantage of this combination is the high expressive power of the constructed graphs and the scalability of the method.
The method was implemented and experimentally evaluated using real test data.
