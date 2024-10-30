import random
import time
countDown = 10
while countDown>0:
  seed = random.randint(0, 1000000)
  random.seed(seed)
  newSeed=seed+5
  #coinFlip=random.randint(1,2)
  sleepTime = random.uniform(0.1, 4.1)
  time.sleep(sleepTime)
  inp = open("verbs.txt")
  verbs=inp.read().split("\n")
  nverbs = len(verbs)
  index = int(random.random()*nverbs)
  inp.close()
  randVerb = verbs[index]
  inp = open("nouns.txt")
  nouns=inp.read().split("\n")
  nnouns = len(nouns)
  index = int(random.random()*nnouns)
  inp.close()
  randNoun = nouns[index]
  print(randVerb+"ing "+randNoun+"...")
  random.seed(newSeed)
  countDown=countDown-1
