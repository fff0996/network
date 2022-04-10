#Alcohol vs 표현형
import networkx as nx
G_a = nx.Graph()


G_a.add_node("AL")



G_a.add_node("ALP")
G_a.add_node("ALT")
G_a.add_node("BMI")
G_a.add_node("CYS")
G_a.add_node("HEI")
G_a.add_node("PHO")
G_a.add_node("RBC")
G_a.add_node("TG")





G_a.add_edge("ALP","AL",weight=0.1928)
G_a.add_edge("ALT","AL",weight=0.1004)
G_a.add_edge("HEI","AL",weight=0.089)
G_a.add_edge("BMI","AL",weight=0.168)
G_a.add_edge("CYS","AL",weight=0.2165)
G_a.add_edge("PHO","AL",weight=0.1471)
G_a.add_edge("RBC","AL",weight=0.2234)
G_a.add_edge("TG","AL",weight=0.2012)

G_a.add_edge("ALP","ALT",weight=0.2684)
G_a.add_edge("ALP","HEI",weight=0.0547)
G_a.add_edge("ALP","BMI",weight=0.1722)
G_a.add_edge("ALP","CYS",weight=0.1356)
#G_a.add_edge("ALP","PHO",weight=0.2165)
G_a.add_edge("ALP","RBC",weight=0.1522)
#G_a.add_edge("ALP","TG",weight=0.2234)

G_a.add_edge("ALT","HEI",weight=0.1323)
G_a.add_edge("ALT","BMI",weight=0.3544)
G_a.add_edge("ALT","CYS",weight= 0.1718)
#G_a.add_edge("ALT","PHO",weight=0.168)
G_a.add_edge("ALT","RBC",weight=0.1762)
G_a.add_edge("ALT","TG",weight=0.2924)

G_a.add_edge("HEI","BMI",weight=0.1655 )
G_a.add_edge("HEI","CYS",weight=0.0584)
#G_a.add_edge("HEI","PHO",weight=0.089)
G_a.add_edge("HEI","RBC",weight=0.0504)
G_a.add_edge("HEI","TG",weight=0.126)



G_a.add_edge("BMI","CYS",weight=0.3461)
#G_a.add_edge("BMI","PHO",weight=0.1004)
G_a.add_edge("BMI","RBC",weight=0.1193)
G_a.add_edge("BMI","TG",weight= 0.2423)


#G_a.add_edge("CYS","PHO",weight=0.1928)
G_a.add_edge("CYS","RBC",weight=0.1613 )
G_a.add_edge("CYS","TG",weight=0.2058 )

G_a.add_edge("PHO","RBC",weight=0.1045)
#G_a.add_edge("PHO","TG",weight=0.1004)


G_a.add_edge("RBC","TG",weight= 0.1051)

#pos = nx.spring_layout(G_a)
d = dict(G_a.degree)
nx.draw(G_a, nodelist = d.keys(), node_size = [v * 100 for v in d.values()], with_labels = True)

#nx.draw(G_a,pos, with_labels = True)
