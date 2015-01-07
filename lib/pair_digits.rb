class PairDigits
  def self.digits_set_key
    'pair_digits'
  end

  def self.expires_key
    'pair_expires'
  end

  def self.initialized_key
    'digits_initialized'
  end

  def self.default_digits
    (1000..9999).map {|k| k}
  end

  def self.initialized?
    !!$redis.get(initialized_key)
  end

  def self.setup_digits
    $redis.multi
    unless initialized?
      $redis.sadd digits_set_key, default_digits
      $redis.set initialized_key, 1
    end
    $redis.exec
  end

  def self.recycle_expires
    result = $redis.zrangebyscore expires_key, '0', 65.seconds.ago.to_i.to_s, with_scores: false
    $redis.zrem expires_key, result
  end

  def self.generate_digits
    recycle_expires

    $redis.multi
    $redis.spop digits_set_key
    digits = $redis.exec[0]

    $redis.zadd expires_key, Time.now.to_i, digits if digits

    digits
  end

end
