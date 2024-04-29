text_esp = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz';
text_en = 'PHHW PH DIWHU WKH WRJD SDUWB';

disp("Caesar cipher English alphabet test")
for i=0:26
    cipher_text = caesar(text_en, i);
    disp(cipher_text);
end

disp("Caesar cipher Spanish alphabet test")
for i=0:27
    cipher_text = spanish_caesar(text_esp, i);
    disp(cipher_text);
end

disp("Playfair cipher test")
clear_text = 'hola mundo';
disp(clear_text)
key_text = 'autobots';
null_letter = 'X';
cipher_text = playfair(clear_text, key_text, null_letter);
disp(cipher_text);