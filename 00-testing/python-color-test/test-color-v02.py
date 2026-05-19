import tkinter as tk
from tkinter import messagebox

def change_color(event=None):
    # event=None allows this function to handle both button clicks and Return key presses
    new_color = color_input.get().strip()
    try:
        root.configure(bg=new_color)
        entry_label.configure(bg=new_color)
    except tk.TclError:
        messagebox.showerror("Error", f"Invalid color: '{new_color}'\nUse Hex (e.g., #4CAF50) or names (e.g., blue).")

def show_context_menu(event):
    context_menu.tk_popup(event.x_root, event.y_root)

def paste_text():
    try:
        color_input.delete(0, tk.END)
        color_input.insert(0, root.clipboard_get().strip())
    except tk.TclError:
        pass

def copy_text():
    # Clear clipboard and copy the currently selected text or the whole field
    root.clipboard_clear()
    selected_text = color_input.selection_get() if color_input.selection_present() else color_input.get()
    root.clipboard_append(selected_text)

# Initialize window
root = tk.Tk()
root.title("Dynamic Color App")
root.geometry("400x350")
root.configure(bg="#333333")

# Create the Right-Click Menu with Copy and Paste
context_menu = tk.Menu(root, tearoff=0)
context_menu.add_command(label="Copy", command=copy_text)
context_menu.add_command(label="Paste", command=paste_text)

# Layout elements
frame = tk.Frame(root, bg="")
frame.pack(expand=True)

entry_label = tk.Label(frame, text="Enter Color Code:", font=("Arial", 14), bg="#333333", fg="white")
entry_label.pack(pady=5)

color_input = tk.Entry(frame, font=("Arial", 14), width=15, justify="center")
color_input.insert(0, "#4CAF50")
color_input.pack(pady=10)

# Bindings
color_input.bind("<Button-3>", show_context_menu)  # Right-click menu
color_input.bind("<Return>", change_color)         # Enter key triggers apply

apply_button = tk.Button(frame, text="Apply Color", font=("Arial", 12, "bold"), command=change_color)
apply_button.pack(pady=10)

root.mainloop()