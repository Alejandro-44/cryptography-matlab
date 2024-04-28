function cipher_text =  caesar(clear_text, key, is_spanish)
    % create a new 
    cipher_text = zeros(1, length(clear_text));
    for i = 1:length(clear_text)
        if isletter(clear_text(i))
            ascii_code = double(clear_text(i));
            if (ascii_code >= 65 && ascii_code <= 90) || ascii_code == 209
                base = 65;
                breakdown = 79;
                spe_char = 209;
            elseif (ascii_code >= 97 && ascii_code <= 122) || ascii_code == 241
                base = 97;
                breakdown = 111;
                spe_char = 241;
            end

            cipher_code = mod(ascii_code - base + key, 26) + base;
            
            if is_spanish
                if ascii_code == breakdown - key
                    cipher_code = spe_char;
                elseif ascii_code > breakdown - key && ascii_code <= breakdown
                    cipher_code = mod(ascii_code - base + key, 26) + base - 1;
                end
            end
            cipher_character = char(cipher_code);
            cipher_text(i) = cipher_character;
        else
            cipher_text(i) = clear_text(i);
        end
    end
    cipher_text = char(cipher_text);
end
