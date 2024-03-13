
view: noise {
  derived_table: {
    sql: -- Similar query, but looking at SNR (signal-to-noise ratio)
      SELECT 
        EXTRACT(HOUR FROM sessionStartTimeDate) AS hour_of_day,
        AVG(snr) AS avg_signal_to_noise
      FROM `datawifi.aggregate`
      GROUP BY hour_of_day
      ORDER BY hour_of_day ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: hour_of_day {
    type: number
    sql: ${TABLE}.hour_of_day ;;
  }

  dimension: avg_signal_to_noise {
    type: number
    sql: ${TABLE}.avg_signal_to_noise ;;
  }

  set: detail {
    fields: [
        hour_of_day,
	avg_signal_to_noise
    ]
  }
}
