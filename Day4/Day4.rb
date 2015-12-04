require 'digest/md5'
a = 1
while true
  digest = Digest::MD5.hexdigest("iwrupvqb#{a.to_s}")
  if digest[0,6] == "000000" then
    puts append
    break
  end
  append += 1
end
