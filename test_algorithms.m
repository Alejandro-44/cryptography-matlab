text_esp = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz';
text_en = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

disp("Caesar cipher English alphabet text")
for i=0:26
    cipher_text = caesar(text_en, i);
    disp(cipher_text);
end

disp("Caesar cipher Spanish alphabet text")
for i=0:27
    cipher_text = spanish_caesar(text_esp, i);
    disp(cipher_text);
end
