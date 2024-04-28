function cipher_text =  caesar(clear_text, key, is_spanish)
    % CAESAR Apply caesar cipher in a text for English and Spanish alphabet.
    %   cipher_text = CAESAR(clear_text, key, is_spanish) 
    % Params
    %   clear_next -> str: message text to cipher 
    %   key        -> int: offset value
    %   is_spanish -> bool: use Sanish alphabet or not
    %
    %   Example:
    %       clear_text = 'Hola';
    %       key = 3;
    %       is_spanish = 1;
    %       cipher_text = caesar(clear_text, key, is_spanish);
    %       OUT: Kqñd

    % create a new zero vector for result 
    cipher_text = zeros(1, length(clear_text));
    % for each letter in clear text
    for i = 1:length(clear_text)
        % only process the character if is a letter
        if isletter(clear_text(i))
            ascii_code = double(clear_text(i)); % get  letter ascii code
            base = 0; % initial code (use to normalize values)
            breakdown = 0; % character code where the ñ would be found 
            spe_char = 0; % ascii code for ñ
            % if the letter is upercase or is Ñ
            if (ascii_code >= 65 && ascii_code <= 90) || ascii_code == 209
                base = 65; 
                breakdown = 79; 
                spe_char = 209; 
            % if the letter is lowercase or is ñ
            elseif (ascii_code >= 97 && ascii_code <= 122) || ascii_code == 241
                base = 97; % initial lowercase letter ascii code 
                breakdown = 111;
                spe_char = 241;
            end
            % calculate new ascii code by the key
            cipher_code = mod(ascii_code - base + key, 26) + base; 
            % if choose encryption with Spanish alphabet
            if is_spanish
                % if the letter is the one that will be replaced by Ñ
                if ascii_code == (breakdown - key)
                    cipher_code = spe_char;
                % if the letter is between the previus one and Ñ
                elseif ascii_code > (breakdown - key) && ascii_code <= breakdown
                    cipher_code = mod(ascii_code - base + key, 26) + base - 1;
                end
            end
            % replace a zero for cipher code in the same position
            cipher_text(i) = cipher_code;
        else
            % replace a zero for the same character in the same potision
            cipher_text(i) = clear_text(i);
        end
    end
    % transform all numbers in characters
    cipher_text = char(cipher_text);
end
