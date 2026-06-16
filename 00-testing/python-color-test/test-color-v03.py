import tkinter as tk
from tkinter import messagebox

def update_from_sliders(*args):
    # Get current values from RGB sliders
    r = red_slider.get()
    g = green_slider.get()
    b = blue_slider.get()
    # Format to Hex string
    hex_code = f"#{r:02x}{g:02x}{b:02x}".upper()
    
    # Update input field and background
    color_input.delete(0, tk.END)
    color_input.insert(0, hex_code)
    apply_background(hex_code)

def update_from_entry(event=None):
    new_color = color_input.get().strip()
    try:
        # Test if color is valid by applying it
        apply_background(new_color)
        
        # If it's a valid Hex, update sliders to match
        if new_color.startswith("#") and len(new_color) == 7:
            r = int(new_color[1:3], 16)
            g = int(new_color[3:5], 16)
            b = int(new_color[5:7], 16)
            
            # Temporarily unbind to prevent infinite loop feedback
            red_slider.set(r)
            green_slider.set(g)
            blue_slider.set(b)
    except (tk.TclError, ValueError):
        messagebox.showerror("Error", f"Invalid color: '{new_color}'\nUse Hex (e.g., #4CAF50) or names (e.g., blue).")

def apply_background(color_code):
    root.configure(bg=color_code)
    main_frame.configure(bg=color_code)
    slider_frame.configure(bg=color_code)
    entry_label.configure(bg=color_code)

def show_context_menu(event):
    context_menu.tk_popup(event.x_root, event.y_root)

def paste_text():
    try:
        color_input.delete(0, tk.END)
        color_input.insert(0, root.clipboard_get().strip())
        update_from_entry()
    except tk.TclError:
        pass

def copy_text():
    root.clipboard_clear()
    selected_text = color_input.selection_get() if color_input.selection_present() else color_input.get()
    root.clipboard_append(selected_text)

# Main window setup
root = tk.Tk()
root.title("Modern Color Studio")
root.geometry("450x500")
root.configure(bg="#2D3250")

# Smooth right-click menu
context_menu = tk.Menu(root, tearoff=0, bg="#424769", fg="white", activebackground="#7077A1")
context_menu.add_command(label="Copy", command=copy_text)
context_menu.add_command(label="Paste", command=paste_text)

# Modern Centered Main Container
main_frame = tk.Frame(root, bg="#2D3250")
main_frame.pack(expand=True, fill="both", padx=30, pady=30)

# Label UI
entry_label = tk.Label(main_frame, text="Color Studio", font=("Helvetica", 18, "bold"), bg="#2D3250", fg="#F6B17A")
entry_label.pack(pady=(10, 20))

# Modern Styled Entry Field
color_input = tk.Entry(main_frame, font=("Courier", 16, "bold"), width=12, justify="center",
                       bg="#424769", fg="#F6B17A", insertbackground="white", bd=0, highlightthickness=2, highlightbackground="#7077A1", highlightcolor="#F6B17A")
color_input.insert(0, "#4CAF50")
color_input.pack(pady=10, ipady=8)

# Bindings
color_input.bind("<Button-3>", show_context_menu)
color_input.bind("<Return>", update_from_entry)

# Container for RGB Sliders
slider_frame = tk.Frame(main_frame, bg="#2D3250")
slider_frame.pack(fill="x", pady=20)

# Macro builder function for modern sliders
def create_slider(color, start_val):
    slider = tk.Scale(slider_frame, from_=0, to=255, orient="horizontal", label=f"{color} Component",
                      font=("Helvetica", 10, "bold"), fg="white", bg="#424769", highlightthickness=0,
                      troughcolor="#2D3250", activebackground="#F6B17A", command=update_from_sliders)
    slider.set(start_val)
    slider.pack(fill="x", pady=5, ipady=2)
    return slider

# Generate Red, Green, Blue UI Sliders
red_slider = create_slider("Red", 76)
green_slider = create_slider("Green", 175)
blue_slider = create_slider("Blue", 80)

# Modern Styled Action Button
apply_button = tk.Button(main_frame, text="Apply Code", font=("Helvetica", 12, "bold"), 
                         bg="#F6B17A", fg="#2D3250", activebackground="#7077A1", activeforeground="white",
                         bd=0, cursor="hand2", command=update_from_entry)
apply_button.pack(pady=15, ipadx=20, ipady=8)

# Sync interface on initial load
update_from_entry()

root.mainloop()
