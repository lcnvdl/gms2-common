function file_write_all_text(filename, content) {
	var stream = file_text_open_write(filename);
	file_text_write_string(stream, content);
	file_text_close(stream);
}

function file_read_all_text(filename) {
	var stream = file_text_open_read(filename);
	var content = "";
	
	while(!file_text_eof(stream)) {
		content += file_text_read_string(stream);
		
		if(!file_text_eof(stream)) {
			file_text_readln(stream);
			content += "\n";
		}
	}
	
	file_text_close(stream);
}