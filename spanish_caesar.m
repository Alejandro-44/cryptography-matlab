function cipher_text = spanish_caesar(clear_text, key)
    % CAESAR Apply caesar cipher in a text for Spanish alphabet.
    %   cipher_text = CAESAR(clear_text, key) 
    % Params
    %   clear_next -> str: message text to cipher 
    %   key        -> int: offset value
    %
    %
    %   Example:
    %       clear_text = 'Español';
    %       key = 3;
    %       cipher_text = caesar(clear_text, key);
    %       OUT: 

    % create a new zero vector for result 
    cipher_text = zeros(1, length(clear_text));
    % for each letter in clear text
    for i = 1:length(clear_text)
        % only process the character if is a letter
        if isletter(clear_text(i))
            ascii_code = double(clear_text(i)); % get  letter ascii code
            % if ascii code is in uppercase letters
            if ascii_code >= 65 && ascii_code <= 90
                base = 65; % initial code for uppercase ascii
                breakpoint = 79; % reference code for breakpoint in uppercase
                special_char = 209; % code for Ñ
            % if ascii code is in lowercase letters
            elseif ascii_code >= 97 && ascii_code <= 122
                base = 97; % initial code for lowercase ascii
                breakpoint = 111; % reference code for breakpoint in lowercase
                special_char = 241; % code for ñ
            end

            % transform ascii code in a code between 0 and 26
            normal_code = 0; % represent normalized code
            % if code is between initial code and 
            if ascii_code >= base && ascii_code < breakpoint
                normal_code = ascii_code - base; % just rest the base
            % if code is far away breakpoint
            elseif ascii_code >= breakpoint && ascii_code <= base + 25
                normal_code = ascii_code - base + 1; % rest the base and add 1
            elseif ascii_code == special_char
                normal_code = 14; % if is ñ or Ñ the code is 14
            end
            
            % get cipher code
            cipher_code = mod(normal_code + key, 27);

            % transform normal code in ascii code
            % The reverse process of normalizing
            if cipher_code >= 0 && cipher_code <= 13
                cipher_code = cipher_code + base;
            elseif cipher_code == 14
                cipher_code = special_char;
            elseif cipher_code > 14 && cipher_code <= 26
                cipher_code = cipher_code + base - 1;
            end
            % put ascii code 
            cipher_text(i) = cipher_code;
        else
            % replace a zero for the same character in the same potision
            cipher_text(i) = clear_text(i);
        end
    end
    % transform all numbers in characters
    cipher_text = char(cipher_text);
end