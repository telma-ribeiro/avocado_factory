#!/usr/bin/python3
## /usr/local/bin/python3

import time  
from watchdog.observers import Observer  
from watchdog.events import PatternMatchingEventHandler 
import argparse
from ezgraphics import GraphicsWindow
import ast
import fileinput
import os.path
import sys
from threading import Thread


n_cells_per_side = 0
n_pixeis = 0
counter = True
filess = []
canvas=""
patterns = []

class MyThread(Thread):
   
    def __init__(self):
        ''' Constructor. '''
 
        Thread.__init__(self) 
 
    def run(self):
        observer = Observer()
        observer.schedule(MyHandler(), path='.')
        observer.start()

        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            observer.stop()
        observer.join()  

def arg_as_list(s):
        v = ast.literal_eval(s)
        if type(v) is not list:
            raise argparse.ArgumentTypeError("Argument \"%s\" is not a list" % (s))
        return v

#def parser():
#        parser = argparse.ArgumentParser('RGB Matrix App')
#        parser.add_argument('-a', action="store", dest="ncps", type=int, help="Matrix side length")
#        parser.add_argument('-b', action="store", dest="np", type=int, help="Num. pixels per cell")
#        parser.add_argument('files', metavar='FILE', nargs='*', help='files to read, if empty, stdin is used. Each line is [[r,g,b],...]')
#        #parser.print_help()

class MyHandler(PatternMatchingEventHandler):

    def process(self, event):
        """
        event.event_type 
            'modified' | 'created' | 'moved' | 'deleted'
        event.is_directory
            True | False
        event.src_path
            path/to/observed/file
        """
        # the file will be processed there
        print (event.src_path, event.event_type)  # print now only for degug

    def on_modified(self, event):
        # self.process(event)
        # ('./lol.txt', 'modified')
        # Verificar conteudo da linha
        # Caso correcto, limpa canvas e mostra
        global counter
        global canvas
        if str(event.src_path[2:]) in patterns:
            time.sleep(0.3)
            for line in fileinput.input(files=event.src_path):
                cells = arg_as_list(line)
                if (len(cells) == (n_cells_per_side*n_cells_per_side)):
                    
                    if counter:
                        win = GraphicsWindow(n_cells_per_side*n_pixeis+1,n_cells_per_side*n_pixeis+1)
                        win.setTitle("RGB Matrix")
                        canvas = win.canvas()
                        counter = False
                    else:
                         canvas.clear()
                        
                    for i in range(n_cells_per_side*n_cells_per_side):
                        x = int(i/n_cells_per_side)
                        y = i%n_cells_per_side
                        canvas.setColor(cells[i][0],cells[i][1],cells[i][2])
                        canvas.drawRectangle(x*n_pixeis,y*n_pixeis,n_pixeis,n_pixeis)

def main():
    
        parser = argparse.ArgumentParser('RGB Matrix App')
        parser.add_argument('-a', action="store", dest="ncps", type=int, help="Matrix side length")
        parser.add_argument('-b', action="store", dest="np", type=int, help="Num. pixels per cell")
        parser.add_argument('files', metavar='FILE', nargs='*', help='files to read, if empty, stdin is used. Each line is [[r,g,b],...]')
            
        global n_cells_per_side
        global n_pixeis
        global filess
        global patterns
        
        if os.path.isfile('RGBMatrixConf.txt') == True:
            my_file = open('RGBMatrixConf.txt','r')
            first_line = my_file.readline().rstrip()
            arglist = first_line.split( )
            arglist.extend(sys.argv)
            res = parser.parse_args(arglist)
            n_cells_per_side = res.ncps
            n_pixeis = res.np
            filess = res.files
            
            #print (sys.argv[1], " ", len(sys.argv[1]))
            if  len(sys.argv)>1 and os.path.isfile(sys.argv[1]) == True:
                patterns.append(sys.argv[1])
                observer = Observer()
                observer.schedule(MyHandler(), path='.')
                observer.start()

                try:
                    while True:
                        time.sleep(1)
                except KeyboardInterrupt:
                    observer.stop()
                observer.join()
            else:
                global counter
                global canvas
                # ler do stdin
                # print ("ler do stdin")
                
                win = GraphicsWindow()
                win.setTitle("RGB Matrix")
                canvas = win.canvas()
                canvas.setWidth(n_cells_per_side*n_pixeis)
                canvas.setHeight(n_cells_per_side*n_pixeis)
                counter = False

                array = []
                for i in range(n_cells_per_side*n_cells_per_side):
                    x = int(i/n_cells_per_side)
                    y = i%n_cells_per_side

                    canvas.setColor(0,0,0)
                    array.append(canvas.drawRectangle(x*n_pixeis,y*n_pixeis,n_pixeis,n_pixeis))
                
                for line in sys.stdin:
                    cells = arg_as_list(line)
                    if (len(cells) == (n_cells_per_side*n_cells_per_side)):
                        
                        # canvas.clear()
                        
                        for i in range(n_cells_per_side*n_cells_per_side):
                            x = int(i/n_cells_per_side)
                            y = i%n_cells_per_side

                            color = "#%02X%02X%02X" % (cells[i][0], cells[i][1], cells[i][2])

                            canvas._tkcanvas.itemconfig(array[i], fill=color, outline=color)

                            #canvas.setColor(cells[i][0],cells[i][1],cells[i][2])
                            #canvas.drawRectangle(x*n_pixeis,y*n_pixeis,n_pixeis,n_pixeis)
                            
                        canvas._tkcanvas.update_idletasks()
                    #time.sleep(0.5)
                    else:
                        print("Error", len(cells), n_cells_per_side * n_cells_per_side)
        else:
            raise IOError("File RGBMatrixConf.txt doesn't appear to exists.")
if __name__ == "__main__":
    main()

   
