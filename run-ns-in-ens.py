from subprocess import call

content_image = raw_input("\nWhat is the name of the file you want to use as your content input image? \n(Make sure that this file exists in ~/neural-style/content-inputs/)\n")

style_image = raw_input("\nWhat is the name of the file you want to use as your style input image? \n(Make sure that this file exists in ~/neural-style/style-input/)\n")

output_image = raw_input("\nWhat do you want your output image to be named? \n(This file will be stored in ~/neural-style/outputs/)\n")

content_path = "/root/neural-style/content-inputs/" + content_image
style_path = "/root/neural-style/style-inputs/" + style_image
output_path = "/root/neural-style/outputs/" + output_image

call(["th", "neural_style.lua", "-gpu", "-1", "-print_iter", "1", "-num_iterations", "10", "-output_image", output_path, "-content_image", content_path, "-style_image", style_path])

