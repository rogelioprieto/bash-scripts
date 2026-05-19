import tkinter as tk

def main():
    root = tk.Tk()
    root.title("Color App")
    root.geometry("400x300")
    
    # Change this HEX value to any color you want
    app_color = "#FF5733" 
    
    # Set the background color
    root.configure(bg=app_color)
    
    # Add a label to show the HEX code
    label = tk.Label(root, text=f"Color: {app_color}", font=("Arial", 24), bg=app_color, fg="white")
    label.pack(expand=True)
    
    root.mainloop()

if __name__ == "__main__":
    main()
