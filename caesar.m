
function cipher_text =  caesar_cipher(clear_text, key)
    clear_text = upper(clear_text);
    cipher_text = zeros(1, length(clear_text));
    for i = 1:length(clear_text)
        if isletter(clear_text(i))
            ascii_code = double(clear_text(i));
            cipher_code = mod(ascii_code - 65 + key, 26) + 65;
            cipher_character = char(cipher_code);
            cipher_text(i) = cipher_character;
        else
            cipher_text(i) = clear_text(i);
        end
        cipher_text = char(cipher_text);
    end
end

% Use example
texto_original = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';
clave = 3;
texto_cifrado = caesar_cipher(texto_original, clave);
disp(texto_cifrado);

