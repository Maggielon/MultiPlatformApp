package me.anastasia.androidApp

import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import me.anastasia.shared.Recipe

class RecipeViewHolder (inflater: LayoutInflater, container: ViewGroup) : RecyclerView.ViewHolder(inflater.inflate(R.layout.item_recipe,container,false)) {
    private var titleText: TextView? = null
    private var ingredientsText: TextView? = null
    private var hrefText: TextView? = null

    init {
        titleText = itemView.findViewById<TextView>(R.id.title_text)
        ingredientsText = itemView.findViewById<TextView>(R.id.ingredients_text)
        hrefText = itemView.findViewById<TextView>(R.id.href_text)
    }

    fun bindItem(item: Recipe) {
        titleText?.text = item.title
        ingredientsText?.text = item.ingredients
        hrefText?.text = item.href
    }
}