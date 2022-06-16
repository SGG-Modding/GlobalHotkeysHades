#repurposed from https://stackoverflow.com/questions/2408560/non-blocking-console-input/57387909#57387909
#pynput hotkey code from https://nitratine.net/blog/post/how-to-make-hotkeys-in-python/#pynputs-hotkey-class
import threading
from pynput import keyboard

class KeyboardThread(threading.Thread):

    def __init__(self, input_cbk = None, name='global-hotkey-listener'):
        self.input_cbk = input_cbk
        super(KeyboardThread, self).__init__(name=name)
        self.start()

    def run(self):
        try:
            while True:
                self.input_cbk() #waits to get input + Return
        except EOFError:
            end()
        except KeyboardInterrupt:
            end()

def my_callback():
    #evaluate the keyboard input
    # Voice called functions
    def one_health():
        scribe.send("GlobalHotkeysHades: " + "one_health")    
    def fifty_damage():
        scribe.send("GlobalHotkeysHades: " + "fifty_damage")  
    def instant_death():
        scribe.send("GlobalHotkeysHades: " + "instant_death")
    def spawn_enemies():
        scribe.send("GlobalHotkeysHades: " + "spawn_enemies")
     

    with keyboard.GlobalHotKeys({
        '<alt>+<shift>+g': one_health,
        '<alt>+<shift>+h': fifty_damage,
        '<alt>+<shift>+j': instant_death,
        '<alt>+<shift>+k': spawn_enemies}) as h:
        h.join()



#start the Keyboard thread

prefix = "GlobalHotkeysHades: "
def load():
    kthread = KeyboardThread(my_callback)

def end():
    scribe.close(True)
