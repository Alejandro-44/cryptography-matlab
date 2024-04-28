
function cipher_text =  caesar_cipher(clear_text, key)
    cipher_text = zeros(1, length(clear_text));
    for i = 1:length(clear_text)
        if isletter(clear_text(i))
            ascii_code = double(clear_text(i));
            base = 0;
            if ascii_code >= 65 && ascii_code <= 90
                base = 65;
            elseif ascii_code >= 97 && ascii_code <= 122
                base = 97;
            end
            cipher_code = mod(ascii_code - base + key, 26) + base;
            cipher_character = char(cipher_code);
            cipher_text(i) = cipher_character;
        else
            cipher_text(i) = clear_text(i);
        end
        cipher_text = char(cipher_text);
    end
end

% Use example
texto_original = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghjklmnopqrstuvwxyz';
clave = 3;
texto_cifrado = caesar_cipher(texto_original, clave);
disp(texto_cifrado);

